midifile <- system.file("extdata", "test_midi_file.mid", package = "pyramidi")
wavfile <- "test.wav"
mp3file <- "test.mp3"

test_that("html tag output works", {
    expect_snapshot(wavfile %>% play_button())
})



test_that("output of synthesized wav file & mp3 conversion correct", {
  testthat::skip_on_ci()
  withr::with_file(c(wavfile, mp3file), {
    testthat::expect_snapshot_output(synthesize_midi(midifile, wavfile, verbose = TRUE))
    testthat::expect_snapshot_output(convert_to_mp3(wavfile, verbose = TRUE))
  })
})
