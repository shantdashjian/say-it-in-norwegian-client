const localStorageKey = 'say-it-in-norwegian'

export def persistData dataToPersist
	localStorage.setItem(localStorageKey, JSON.stringify(Array.from(dataToPersist)))

export def loadData
	if localStorage.getItem(localStorageKey) 
		new Map(JSON.parse(localStorage.getItem(localStorageKey)))
	else 
		return new Map()
		