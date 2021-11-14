#' Synthesize midi file
#'
#' Needs fluidsynth installed; no idea how this works on windows.
#'
#' @param audiofile audio wav file
#' @param midifile midi file path
#' @param soundfont path to sf2 sound font
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' midifile <- system.file("extdata", "test_midi_file.mid", package = "raudiomate")
#' audiofile <- "test.wav"
#' synthesize_midi(midifile, audiofile)
#' }
synthesize_midi <- function(midifile, audiofile, soundfont = NULL) {
  system(
    paste(
      c(
        "fluidsynth",
        soundfont,
        "-F",
        audiofile,
        midifile
      ),
      collapse = " "
    )
  )
}


#' Convert wav to mp3
#'
#' Needs lame installed
#'
#' @param wav_filename wav filename
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
convert_to_mp3 <- function(wav_filename) {
  mp3_filename <- gsub("wav", "mp3", wav_filename)

  cmd_res <- processx::run(
    "lame",
    wav_filename,
    mp3_filename,
  )
  if (!cmd_res$status != 0) {
    stop("mp3 conversion didn't work")
  }
  message("generated ", mp3_filename)
}

#' Play midi file
#'
#' Transform the midi file to fileext format and provide a play button for html
#' documents.
#'
#' @param mfr r_midi_frames object
#' @param audiofile audiofile
#' @param fileext file extension
#'
#' @return
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
