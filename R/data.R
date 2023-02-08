#' 94-replicates-4-dilutions set
#'
#' @description
#' The 94-replicates-4-dilutions set is a dilution series consisting of four
#' 10-fold serial dilution points, starting from 15,000 molecules down to 15
#' molecules, created using 10 ng/µl yeast tRNA as carrier (Roche). The same
#' dilution of the carrier was used to create the NTC sample.
#'
#' qPCR was done on a CFX 384 instrument (Bio-Rad). A 384-well qPCR plate was prepared using a
#' 96-well head pipetting robot (Tecan Freedom Evo 150). qPCR amplifications
#' were performed in 8 µl containing:
#' - 4 µl iQ SYBR Green Supermix (Bio-Rad);
#' - 0.4 µl forward and 0.4 µl reverse primer (5 µM each);
#' - 0.2 µl nuclease-free water;
#' - 3 µl of standard oligonucleotide.
#'
#' A total of 94 replicated reactions were dispensed for each of 4 dilution
#' points. In addition, the NTC reaction was analyzed in 8 replicates.
#'
#' All reactions were performed in 384-well plates (Hard-Shell 384-well
#' microplates and Microseal B clear using adhesive seals (Bio-Rad).
#'
#' The cycling conditions were comprised of 3 min polymerase activation at 95 °C
#' and 45 cycles of 15 s at 95 °C and 30 s at 60 °C followed by a dissociation
#' curve analysis from 60 to 95 °C.
#'
#' ## Admonition
#' The concentration information for the curves in this data set was seemingly
#' incorrectly indicated (confirmed by email with the senior author Prof. Jo
#' Vandesompele). The annotation provided in the supplementary material that
#' accompanies the original publication was reversed. So, to correct for this,
#' the annotation of the number of copies in `ds_94_4` has been changed:
#' - 15 became 15,000
#' - 150 became 1,500
#' - 1,500 became 150
#' - 15,000 became 15
#'
#' @format ## `ds_94_4`
#' A data frame with 17,280 rows and 9 columns:
#' \describe{
#' \item{`well`}{Well identifier.}
#' \item{`replicate`}{Replicate identifier.}
#' \item{`dye`}{In all reactions the SYBR Green I master mix (Roche) was used,
#' so the value is always `"SYBR"`.}
#' \item{`target`}{Target identifier: MYCN.}
#' \item{`sample_type`}{Sample type: `"ntc"` (no template control) or `"std"` (standard).}
#' \item{`copies`}{Standard copy number: either `0` (for NTCs), or `15`, `150`,
#' `1500` or `15000` for standards.}
#' \item{`dilution`}{Dilution factor (the reciprocal of `copies`). Higher number
#' means greater dilution.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#' @source <https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip>
"ds_94_4"

#' 380-replicates set
#'
#' @description
#' The 380-replicates set is a dilution consisting of 150,000 molecules (see the
#' Admonition section below) of the MYCN oligonucleotide was created in 10 ng/µl
#' yeast tRNA carrier. qPCR amplifications were performed in 380 replicated 8 µl
#' reactions and quadruplicated reactions of the NTC sample were performed on
#' the same 384-well plate.
#'
#' qPCR was done on a CFX 384 instrument (Bio-Rad). A 384-well qPCR plate was prepared using a
#' 96-well head pipetting robot (Tecan Freedom Evo 150). qPCR amplifications
#' were performed in 8 µl containing:
#' - 4 µl iQ SYBR Green Supermix (Bio-Rad);
#' - 0.4 µl forward and 0.4 µl reverse primer (5 µM each);
#' - 0.2 µl nuclease-free water;
#' - 3 µl of standard oligonucleotide.
#'
#' All reactions were performed in 384-well plates (Hard-Shell 384-well
#' microplates and Microseal B clear using adhesive seals (Bio-Rad).
#'
#' The cycling conditions were comprised of 3 min polymerase activation at 95 °C
#' and 45 cycles of 15 s at 95 °C and 30 s at 60 °C followed by a dissociation
#' curve analysis from 60 to 95 °C.
#'
#' ## Admonition
#'
#' The concentration information for the curves in this data set was seemingly
#' incorrectly indicated in the original publication (confirmed by email with
#' the senior author Prof. Jo Vandesompele). Instead of the 15,000 copies
#' reported in the original paper, the number of copies was most likely 150,000
#' copies (10x the value indicated).
#'
#' @format ## `ds_380`
#' A data frame with 17,280 rows and 9 columns:
#' \describe{
#' \item{`well`}{Well identifier.}
#' \item{`replicate`}{Replicate identifier.}
#' \item{`dye`}{In all reactions the SYBR Green I master mix (Roche) was used,
#' so the value is always `"SYBR"`.}
#' \item{`target`}{Target identifier: MYCN.}
#' \item{`sample_type`}{Sample type: `"ntc"` (no template control) or `"std"` (standard).}
#' \item{`copies`}{Standard copy number: either `0` (for NTCs), or `150000` for standards.}
#' \item{`dilution`}{Dilution factor (the reciprocal of `copies`). Higher number
#' means greater dilution.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#' @source <https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip>
"ds_380"

#' Competimer set
#'
#' @description
#' Competitive primers were synthesized on basis of identical sequence and
#' blocked by amination at the 3' end to allow annealing, but avoid elongation
#' during the PCR process.
#'
#' A six-point 4-fold serial dilution series made from reference human genomic
#' DNA (Roche), starting from 64 ng/µl down to 0.0625 ng/µl, was created in 10
#' ng/µl yeast tRNA as carrier. The same dilution of the carrier was used to
#' create a NTC sample.
#'
#' qPCR amplifications were performed in 7.5 µl total reaction volume containing:
#' - 3.75 µl 2x custom made qPCR SYBR green I Mastermix (Eurogentec)
#' - 0.375 µl forward primer (5 µM) and 0.375 µl reverse primer (5 µM)
#' - 1 µl of a mixture of nuclease-free water and equal amounts of both forward and reverse competitive (aminated) primers
#' - 2 µl diluted standard
#'
#' A total of 7 competitive mixes were prepared for each dilution point,
#' containing 0%, 5%, 10%, 20%, 30%, 40%, and 50% (of the total amount of
#' primer) competitive (aminated) forward and reverse primers. Each reaction was
#' run in triplicate.
#'
#' The qPCR cycling was performed on the LightCycler480 (Roche) using white
#' LightCycler480 384-multiwell plates with Light-Cycler480 sealing foils
#' (Roche).
#'
#' The cycling conditions were com  prised of 10 min polymerase activation at 95
#' °C, and 45 cycles of 15 s at 95 °C, 30 s at 60 °C, followed by a dissociation
#' curve analysis from 60 to 95 °C.
#'
#' @format ## `ds_competimer`
#' A data frame with 6,615 rows and 10 columns:
#' \describe{
#' \item{`well`}{Well identifier.}
#' \item{`replicate`}{Replicate identifier.}
#' \item{`dye`}{In all reactions the SYBR Green I master mix (Roche) was used,
#' so the value is always `"SYBR"`.}
#' \item{`pct`}{Percentage of competitive (aminated) primers in the mix.}
#' \item{`conc`}{Concentration of reference human genomic DNA (Roche): from 64
#' ng/µl down to 0.0625 ng/µl.}
#' \item{`target`}{Target identifier: AluSx.}
#' \item{`sample_type`}{Sample type: `"ntc"` (no template control) or `"std"` (standard).}
#' \item{`dilution`}{Dilution factor (the reciprocal of `conc`, i.e. `64 / conc`). Higher number
#' means greater dilution.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#' @source <https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip>
"ds_competimer"
