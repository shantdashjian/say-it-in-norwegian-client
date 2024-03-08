const localStorageKey = 'say-it-in-norwegian'

export def persistData dataToPersist
	localStorage.setItem(localStorageKey, JSON.stringify(Array.from(dataToPersist)))

export def loadData
	if localStorage.getItem(localStorageKey) 
		new Map(JSON.parse(localStorage.getItem(localStorageKey)))
	else 
		let data = new Map()
		data.set('1', {
			englishText: 'Hi',
			norwegianText: 'Hei',
			gifUrl: 'https://media1.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif?cid=6f294ec9ynbseroxv3yyr14sshx9hc1bz2giazu3k3h9mu6z&ep=v1_gifs_translate&rid=giphy.gif&ct=g'
			highlighted: false
		})
		data.set('2', {
			englishText: 'Hi',
			norwegianText: 'Hei',
			gifUrl: 'https://media1.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif?cid=6f294ec9ynbseroxv3yyr14sshx9hc1bz2giazu3k3h9mu6z&ep=v1_gifs_translate&rid=giphy.gif&ct=g'
			highlighted: true
		})
		data.set('3', {
			englishText: 'Hi',
			norwegianText: 'Hei',
			gifUrl: 'https://media1.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif?cid=6f294ec9ynbseroxv3yyr14sshx9hc1bz2giazu3k3h9mu6z&ep=v1_gifs_translate&rid=giphy.gif&ct=g'
			highlighted: false
		})
		return data