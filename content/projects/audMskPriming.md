+++
title = "Prime masking in the auditory modality"
type = "projects"
tags = ["processing", "decomposition", "methods", "morphology"]

share = false
profile = false

lastmod = 2021-03-25

authors = ["robpetro", "jon", "diogo"]

[design]
  # Choose how many columns the section has. Valid values: 1 or 2.
  columns = "1"
+++

Most psycholinguistic research on morphological decomposition has been conducted in the [visual modality]({{< relref "/content/projects/decomposition.md" >}}). The main reason for this is that our current behavioral methodologies seem unable to investigate auditory decomposition at the subliminal level of processing. Since auditory stimuli typically unfold over time, the masking procedure of auditory prime stimuli is particularly harder to implement. In recent years, however, the pioneering study by Kouider & Dupoux (2005) has provided an interesting way to implement prime masking in auditory priming. This technique resembles the typical prime-target sound stream, but features the following specifics (see the figure below). All primes are first intensity-attenuated and then time-compressed, so that their original duration was reduced to usually between 35\% and 40\% of their original duration. Randomly selected, attenuated, and time-compressed primes are also time-reversed to create auditory masks. Each time-compressed prime is preceded by one mask and followed by four other different masks; the target word (at normal speech rate and volume) is imposed over the sequence of masks and prime so that the onset of the target coincided with the offset of the prime. 

{{< figure library="true" src="audMskPr_trial.jpg" title="Schematic description of a typical trial in Kouider & Dupoux (2005)'s auditory masked priming paradigm. The attenuated and time-compressed prime is immediately preceded and followed by attenuated, time-compressed, and time-reversed masks (as indicated by the label _ksam_, i.e. the word '_mask_' in reverse). The target is played at normal speech rate and is not attenuated; it immediately follows the prime (i.e., its onset coincides with the offset of the prime) and is superimposed on the rightward mask stream." >}}

Participants usually report hearing a clear word (i.e., the target word sound) surrounded by unintelligible babble. As an illustrative example, play the audio file right below: the target word _SHARP_ is preceded by what looks like babble, in which an attenuated, time-compressed prime was imposed over a stream of attenuated, time-compressed and time-reversed words.

{{< audio src="audMskPr_example.mp3" >}}

While promising, the design described above however proved to suffer from a number of methodological issues, as preliminary tests have shown. The issues seem to be connected to the interplay between the time-compression rate and the phonological length of the prime stimuli, which have a substantial impact on the subliminal intelligibility of the prime -- and, ultimately, to priming elicitation. A full-length study is being conducted that explores the interdependence of compression duration, the linguistic/acoustic factors just mentioned, and priming effects, with the ultimate goal of defining the minimum compressed duration at which priming can be obtained. 

