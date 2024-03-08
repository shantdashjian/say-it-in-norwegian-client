export def reverse translations
	let array = Array.from(translations)
	let reverse = array.reverse()
	let map = new Map()
	for translation in reverse
		map.set(translation[0], translation[1])
	return map