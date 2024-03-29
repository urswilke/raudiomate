% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/audio.R
\name{convert_to_mp3}
\alias{convert_to_mp3}
\title{Convert wav to mp3}
\usage{
convert_to_mp3(wav_filename, verbose = FALSE)
}
\arguments{
\item{wav_filename}{wav filename}

\item{verbose}{logical if to print ffmpeg conversion console output; defaults to FALSE}
}
\description{
Needs lame installed
}
\examples{
\dontrun{
midifile <- system.file("extdata", "test_midi_file.mid", package = "pyramidi")
audiofile <- "test.wav"
synthesize_midi(midifile, audiofile)
convert_to_mp3(audiofile)
}
}
