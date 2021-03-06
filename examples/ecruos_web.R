library(Rssa)
library(lattice)
library(methods)

# lattice.options(default.theme =
#                 modifyList(standard.theme("svg", color = TRUE),
#                            list(
#                              fontsize = list(text = 12, points = 5),
#                              layout.heights =
#                                 list(top.padding = 0.1,
#                                      key.axis.padding = 0.25,
#                                      axis.xlab.padding = 0.1,
#                                      xlab.key.padding = 0.1,
#                                      key.sub.padding = 0.25,
#                                      bottom.padding = 0.1),
#                                 layout.widths =
#                                 list(left.padding = 0.1,
#                                      key.ylab.padding = 0.1,
#                                      ylab.axis.padding = 0.1,
#                                      axis.key.padding = 0.1,
#                                      right.padding = 1))))

trellis.par.set("text", 12)
trellis.par.set("points", 5)
# trellis.par.set(strip.background=list(col="white"))
# trellis.par.get("fontsize")


parestimate <- function(...) {
    result <- Rssa::parestimate(...)
    result
}

plot <- function(...) graphics::plot(...)
levelplot <- function(...) lattice::levelplot(...)

pdf <- function(...) {
    params <- list(...)
    name <- gsub("\\.pdf", ".svg", params[[1]])
    clean_name <- regex.extract.group("\\.\\./img.*/(.*)\\.svg", name)[[1]]
    width <- 8
    height <- 5
    
    if ("width" %in% names(params))
        width <- params$width * 1.6
    if ("height" %in% names(params))
        height <- params$height * 1.6
    
    if (clean_name %in% fixed_size) {
        scale <- min(5 / height, 8 / width)
        width <- width * scale
        height <- height * scale
    }
    
    par(cex = 2)
    
    if (clean_name %in% use_trueraster_plot){
        plot <<- function(...) graphics::plot(..., useRaster = TRUE)
        levelplot <<- function(...) lattice::levelplot(..., useRaster = TRUE)
        } else
            if (clean_name %in% use_falseraster_plot)
                plot <<- function(...) graphics::plot(..., useRaster = FALSE) else {
                    plot <<- function(...) graphics::plot(...)
                    levelplot <<- function(...) lattice::levelplot(...)
                }
                    
    svg(name, width = width, height = height)
}

fragmentStart <- function(file) {
  cat(sprintf("@@@fragmentStart\n%s\n", file))
}

fragmentStop <- function() {
  cat(sprintf("@@@fragmentStop\n"))
}

fragmentSkip <- function(exp) {
  capture.output(eval(substitute(exp), envir = parent.frame()))
}

ecruos <- function(x, ...) {
  # take output
  lines <- capture.output(source(x, ..., echo = FALSE, max.deparse.length = Inf, keep.source = TRUE))
  # then draw all images
  capture.output(source(x, ..., echo = TRUE, max.deparse.length = Inf, keep.source = TRUE))
  print(lines)
  # lines <- lines[lines != ""]

  fragmentStart.calls <- grep("^@@@fragmentStart$", lines)
  fragmentStop.calls <- grep("^@@@fragmentStop$", lines)
  stopifnot(length(fragmentStart.calls) == length(fragmentStop.calls))
  if (length(fragmentStart.calls) > 0) {
    fragment.names <- lines[fragmentStart.calls + 1]
    for (i in seq_along(fragment.names)) {
      if (fragmentStop.calls[i] - 1 - (fragmentStart.calls[i] + 2) >= 0) {
          cur.lines <- lines[seq(fragmentStart.calls[i] + 2, fragmentStop.calls[i] - 1)]  
      } else
      {
          cur.lines <- c()
      }

      cur.lines <- c("```",
                     cur.lines,
                     "```")
      cat(file = gsub("\\.tex", ".txt", fragment.names[i]), paste(cur.lines, collapse = "\n"))
    }
  }
}

regex.extract.group <- function(pattern, x, group = 1) {
  match <- gregexpr(pattern, x, perl = TRUE)
  match <- lapply(match, function(x) {
      x[] <-attr(x, "capture.start")[group, ]
      attr(x, "match.length") <- attr(x, "capture.length")[group, ]
      attr(x, "capture.start") <- attr(x, "capture.names") <- attr(x, "capture.names") <- NULL
      x
    })
  regmatches(x, match)
}

extract.fragments <- function(infile, dir = "",
                              dropEmptyLines = TRUE,
                              dropComments = FALSE,
                              drop3Comments = TRUE,
                              dropSkips = TRUE) {
  lines <- readLines(infile)

  if (dropEmptyLines)
    lines <- lines[lines != ""]

  if (dropComments)
    lines <- lines[!grepl("^\\s*#", lines)]

  if (drop3Comments)
    lines <- lines[!grepl("^\\s*###", lines)]

  skips <- grepl("\\s*fragmentSkip\\s*\\(.*)", lines)
  if (dropSkips) {
    lines <- lines[!skips]
  } else {
    lines[skips] <- unlist(regex.extract.group("\\s*fragmentSkip\\s\\(\\s*(.*)\\s*\\)", lines))
  }

  fragment.start.regex <- "\\s*fragmentStart\\s*\\(\\s*\"(.*)\"\\s*\\)"
  fragment.start <- grep(fragment.start.regex, lines)
  fragment.stop <- grep("\\s*fragmentStop\\s*\\(*\\)", lines)

  fragment.names <- unlist(regex.extract.group(fragment.start.regex, lines))
  print(fragment.names)
  fragment.names <- unlist(regex.extract.group("\\.\\./fragments.*/(.*)\\.tex", lines))
  print(fragment.names)
  
  
  print(fragment.start)
  print(fragment.stop)

  stopifnot(length(fragment.start) == length(fragment.stop))
  stopifnot(length(fragment.start) == length(fragment.names))

  for (i in seq_along(fragment.names)) {
    lines[fragment.start[i]] <- "{% highlight r %}"
    lines[fragment.stop[i]] <- "{% endhighlight %}"
    res <- paste0(lines[fragment.start[i]:fragment.stop[i]], collapse = "\n")
    cat(res, file = paste0(dir, "/", fragment.names[i], ".txt"))
    
  }
}

ecruos.and.extract <- function(filename, dir, ...) {
    ecruos(filename, ...)
    extract.fragments(filename, dir)
}
