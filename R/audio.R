#' Synthesize midi file
#'
#' Generates a wav \code{audiofile} from a \code{midifile} using the \code{soundfont} if specified
#' (otherwise fluidsynth's default soundfont is used). Needs fluidsynth
#' to be installed.
#'
#' @param audiofile path to audio wav file (character string)
#' @param midifile path to midi file path (character string)
#' @param soundfont path to sf2 sound font (character string)
#' @param verbose logical whether to print fluidsynth command line output; defaults to FALSE
#'
#' @export
#'
#' @examples
#' \dontrun{
#' midifile <- system.file("extdata", "test_midi_file.mid", package = "raudiomate")
#' audiofile <- "test.wav"
#' synthesize_midi(midifile, audiofile)
#' }
synthesize_midi <- function(midifile, audiofile, soundfont = NULL, verbose = FALSE) {
  cmd_res <- processx::run(
    "fluidsynth",
    args = c(
      soundfont,
      "-F",
      audiofile,
      midifile
    )
  )
  if (verbose) {
    cat(cmd_res$stdout)
  }
}


#' Convert wav to mp3
#'
#' Needs lame installed
#'
#' @param wav_filename wav filename
#' @param verbose logical if to print ffmpeg conversion console output; defaults to FALSE
#'
#' @export
#'
#' @examples
#' \dontrun{
#' midifile <- system.file("extdata", "test_midi_file.mid", package = "pyramidi")
#' audiofile <- "test.wav"
#' synthesize_midi(midifile, audiofile)
#' convert_to_mp3(audiofile)
#' }
convert_to_mp3 <- function(wav_filename, verbose = FALSE) {
  mp3_filename <- gsub("wav", "mp3", wav_filename)
  cmd_res <- processx::run(
    "ffmpeg",
    args = c(
      "-i",
      wav_filename,
      mp3_filename
    )
  )
  if (cmd_res$status != 0) {
    stop("mp3 conversion didn't work")
  }
  if (verbose) {
    cat(cmd_res$stderr)
  }
}

#' Play midi file
#'
#' Transform the midi file to fileext format and provide a play button for html
#' documents.
#'
#' @param audiofile audiofile
#' @param fileext file extension
#'
#' @return html tag of a playbutton
#' @export
#'
#' @examples
#' \dontrun{
#' midifile <- system.file("extdata", "test_midi_file.mid", package = "pyramidi")
#' audiofile <- "test.wav"
#' synthesize_midi(midifile, audiofile)
#' convert_to_mp3(audiofile)
#' audiofile %>% play_button()
#' }
play_button <- function(
  audiofile,
  fileext = "wav"
) {
  html_tag_audio(audiofile, fileext)
}

# from here: https://community.rstudio.com/t/audio-files-in-r-markdown/20874/3
html_tag_audio <- function(file, type = c("wav", "mp3")) {
  type <- match.arg(type)
  htmltools::tags$audio(
    controls = "",
    htmltools::tags$source(
      src = file,
      type = glue::glue("audio/{type}", type = type)
    )
  )
}
