midifile <- system.file("extdata", "test_midi_file.mid", package = "raudiomate")
wavfile <- "test.wav"
mp3file <- "test.mp3"

test_that("html tag output works", {
    expect_snapshot(wavfile %>% player())
})


testthat::skip_on_ci()
test_that("output of synthesized wav file & mp3 conversion correct", {

  withr::with_file(c(wavfile, mp3file), {
    expect_success(
      expect_null(
        # testthat::skip_on_ci()
        synthesize_midi(midifile, wavfile, verbose = TRUE)
      )
    )

    expect_success(
      expect_null(
        synthesize_midi(midifile, wavfile)
      )
    )


    testthat::expect_success({
      # null means the function didn't throw an error:
      expect_null(convert_to_mp3(wavfile))
    })

  })
})
