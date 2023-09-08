
<!-- README.md is generated from README.Rmd. Please edit that file -->

# raudiomate

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/raudiomate)](https://CRAN.R-project.org/package=raudiomate)
[![Codecov test
coverage](https://codecov.io/gh/urswilke/raudiomate/branch/master/graph/badge.svg)](https://app.codecov.io/gh/urswilke/raudiomate?branch=master)
[![R-CMD-check](https://github.com/urswilke/raudiomate/workflows/R-CMD-check/badge.svg)](https://github.com/urswilke/raudiomate/actions)
<!-- badges: end -->

The goal of raudiomate is to provide helper functions to generate wav
audio files from midi files (with
[fluidsynth](https://www.fluidsynth.org/)), convert them to mp3 (with
[ffmpeg](https://www.ffmpeg.org/)), and play these audio files in
rmarkdown html documents.

## Installation

You can install the development version of raudiomate like so:

``` r
remotes::install_github("urswilke/raudiomate")
```

Further dependencies:

- For `synthesize_midi()` to work, you need
  [fluidsynth](https://www.fluidsynth.org/) installed.
- For `convert_to_mp3()` you need [ffmpeg](https://www.ffmpeg.org/).

## Example

This is a basic example how you can apply the functions. We’ll use the
midifile included in the package:

``` r
library(raudiomate)

midifile <- system.file("extdata", "test_midi_file.mid", package = "pyramidi")
audiofile <- "test.wav"
```

### Synthesize a midi file

``` r
synthesize_midi(midifile, audiofile, verbose = TRUE)
#> FluidSynth runtime version 2.1.1
#> Copyright (C) 2000-2020 Peter Hanappe and others.
#> Distributed under the LGPL license.
#> SoundFont(R) is a registered trademark of E-mu Systems, Inc.
#> 
#> Rendering audio to file 'test.wav'..
```

### Convert wav to mp3

``` r
convert_to_mp3(audiofile, verbose = TRUE)
#> ffmpeg version 4.2.4-1ubuntu0.1 Copyright (c) 2000-2020 the FFmpeg developers
#>   built with gcc 9 (Ubuntu 9.3.0-10ubuntu2)
#>   configuration: --prefix=/usr --extra-version=1ubuntu0.1 --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=amd64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-nvenc --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared
#>   WARNING: library configuration mismatch
#>   avcodec     configuration: --prefix=/usr --extra-version=1ubuntu0.1 --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=amd64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-nvenc --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-version3 --disable-doc --disable-programs --enable-libaribb24 --enable-liblensfun --enable-libopencore_amrnb --enable-libopencore_amrwb --enable-libtesseract --enable-libvo_amrwbenc
#>   libavutil      56. 31.100 / 56. 31.100
#>   libavcodec     58. 54.100 / 58. 54.100
#>   libavformat    58. 29.100 / 58. 29.100
#>   libavdevice    58.  8.100 / 58.  8.100
#>   libavfilter     7. 57.100 /  7. 57.100
#>   libavresample   4.  0.  0 /  4.  0.  0
#>   libswscale      5.  5.100 /  5.  5.100
#>   libswresample   3.  5.100 /  3.  5.100
#>   libpostproc    55.  5.100 / 55.  5.100
#> Guessed Channel Layout for Input Stream #0.0 : stereo
#> Input #0, wav, from 'test.wav':
#>   Duration: 00:00:10.67, bitrate: 1411 kb/s
#>     Stream #0:0: Audio: pcm_s16le ([1][0][0][0] / 0x0001), 44100 Hz, stereo, s16, 1411 kb/s
#> Stream mapping:
#>   Stream #0:0 -> #0:0 (pcm_s16le (native) -> mp3 (libmp3lame))
#> Press [q] to stop, [?] for help
#> Output #0, mp3, to 'test.mp3':
#>   Metadata:
#>     TSSE            : Lavf58.29.100
#>     Stream #0:0: Audio: mp3 (libmp3lame), 44100 Hz, stereo, s16p
#>     Metadata:
#>       encoder         : Lavc58.54.100 libmp3lame
#> size=     168kB time=00:00:10.68 bitrate= 128.5kbits/s speed=34.6x    
#> video:0kB audio:167kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.147640%
#> generated test.mp3
```

### Play a file

``` r
audiofile %>% player()
```

<audio controls="">
<source src="https://urswilke.github.io/raudiomate/articles/test.mp3" type="audio/mp3"/>
</audio>
<br/>
<!-- 
The following as well as the bibtex file "pkg-refs.bib" were automatically
created with the commands:
library(grateful)
pkgs <- scan_packages()
# don't know why including "R" gives an error ??
pkgs <- pkgs[!pkgs %in% c("raudiomate")]
cites <- get_citations(pkgs)
rmd <- create_rmd(cites)
&#10;-> then copy the list in the created refs.Rmd below
&#10;-->

## R packages used

This package stands on the shoulders of giants. A big thank you to the
authors of the following libraries!

- base (R Core Team 2021)
- pkgdown (Wickham and Hesselberth 2020)
- processx (Csárdi and Chang 2021)
- htmltools (Cheng et al. 2021)
- magrittr (Bache and Wickham 2020)
- glue (Hester 2021)
- withr (Hester et al. 2021)
- covr (Hester 2020)
- knitr (Xie 2014)
- rmarkdown (Xie, Dervieux, and Riederer 2020)
- testthat (Wickham 2011)

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-magrittr" class="csl-entry">

Bache, Stefan Milton, and Hadley Wickham. 2020. *Magrittr: A
Forward-Pipe Operator for r*.
<https://CRAN.R-project.org/package=magrittr>.

</div>

<div id="ref-htmltools" class="csl-entry">

Cheng, Joe, Carson Sievert, Barret Schloerke, Winston Chang, Yihui Xie,
and Jeff Allen. 2021. *Htmltools: Tools for HTML*.
<https://CRAN.R-project.org/package=htmltools>.

</div>

<div id="ref-processx" class="csl-entry">

Csárdi, Gábor, and Winston Chang. 2021. *Processx: Execute and Control
System Processes*. <https://CRAN.R-project.org/package=processx>.

</div>

<div id="ref-covr" class="csl-entry">

Hester, Jim. 2020. *Covr: Test Coverage for Packages*.
<https://CRAN.R-project.org/package=covr>.

</div>

<div id="ref-glue" class="csl-entry">

———. 2021. *Glue: Interpreted String Literals*.
<https://CRAN.R-project.org/package=glue>.

</div>

<div id="ref-withr" class="csl-entry">

Hester, Jim, Kirill Müller, Kevin Ushey, Hadley Wickham, and Winston
Chang. 2021. *Withr: Run Code ’with’ Temporarily Modified Global State*.
<https://CRAN.R-project.org/package=withr>.

</div>

<div id="ref-base" class="csl-entry">

R Core Team. 2021. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

</div>

<div id="ref-testthat" class="csl-entry">

Wickham, Hadley. 2011. “Testthat: Get Started with Testing.” *The R
Journal* 3: 5–10.
<https://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf>.

</div>

<div id="ref-pkgdown" class="csl-entry">

Wickham, Hadley, and Jay Hesselberth. 2020. *Pkgdown: Make Static HTML
Documentation for a Package*.
<https://CRAN.R-project.org/package=pkgdown>.

</div>

<div id="ref-knitr" class="csl-entry">

Xie, Yihui. 2014. “Knitr: A Comprehensive Tool for Reproducible Research
in R.” In *Implementing Reproducible Computational Research*, edited by
Victoria Stodden, Friedrich Leisch, and Roger D. Peng. Chapman;
Hall/CRC. <http://www.crcpress.com/product/isbn/9781466561595>.

</div>

<div id="ref-rmarkdown" class="csl-entry">

Xie, Yihui, Christophe Dervieux, and Emily Riederer. 2020. *R Markdown
Cookbook*. Boca Raton, Florida: Chapman; Hall/CRC.
<https://bookdown.org/yihui/rmarkdown-cookbook>.

</div>

</div>
