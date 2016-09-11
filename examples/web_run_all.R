source("ecruos_web.R")

use_trueraster_plot <- c("sunspots_change22", "sunspots_change44", "Mars_shaped_mask_0",
                         "Mars_shaped_mask_1", "Mars_shaped_mask_res")
use_falseraster_plot <- c("3sin_ssa_wcor", "auto_wcor", "bootstrap_wcor",
                          "fort_wcor", "shssa_wcor", "Mars_25_ident_wcor",
                          "Mars_shaped_ident_wcor", "Mars_shaped_fossa_ident_wcor",
                          "wineFortDry_wcor")

fixed_size <- c("winetotal_forecast", "image_color", "image_rec_color")

setwd("master")

setwd("code_ch1")
ecruos.and.extract("b_ssa_analysis.R", "../../sources_ch1")
ecruos.and.extract("b_ssa_analysis_sim.R", "../../sources_ch1")
ecruos.and.extract("b_ssa_analysis_sim_iossa.R", "../../sources_ch1") #time-comsuming
ecruos.and.extract("b_ssa_reallife.R", "../../sources_ch1")
ecruos.and.extract("b_ssa_forecast.R", "../../sources_ch1")
ecruos.and.extract("b_ssa_reallife_forecast.R", "../../sources_ch1")
ecruos.and.extract("b_ssa_reallife_bforecast.R", "../../sources_ch1") #time-consuming
setwd("../")

setwd("code_ch2d")
ecruos.and.extract("b_2dssa_plots.R", "../../sources_ch2d")
ecruos.and.extract("b_2dssa_typical.R", "../../sources_ch2d")
ecruos.and.extract("b_shssa_typical.R", "../../sources_ch2d")
ecruos.and.extract("b_2dssa_smoothing.R", "../../sources_ch2d")
ecruos.and.extract("b_rect_vs_shaped.R", "../../sources_ch2d")
ecruos.and.extract("b_ndssa.R", "../../sources_ch2d")
setwd("../")

setwd("code_chm")
ecruos.and.extract("b_cssa.R", "../../sources_chm")
ecruos.and.extract("b_mssa_decomp.R", "../../sources_chm")
ecruos.and.extract("b_mssa_comparison.R", "../../sources_chm")
setwd("../")


setwd("../")
