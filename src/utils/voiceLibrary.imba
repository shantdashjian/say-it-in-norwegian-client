export default def play(text)
	if responsiveVoice.voiceSupport()
		responsiveVoice.speak(text, "Norwegian Male")

