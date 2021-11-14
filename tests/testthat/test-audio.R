midifile <- system.file("extdata", "test_midi_file.mid", package = "pyramidi")
audiofile <- "test.wav"

test_that("multiplication works", {
    expect_snapshot(audiofile %>% play_button())
})
