tag history
	css
		.small-header fs:1.5rem ta:center bgc:var(--light-red) p:1rem 0.8rem 0.6rem 0.8rem mb:1rem
		.tranlation d:vflex
		.translation-text fs:1.5rem bgc:gray0 p:0.3rem 0.3rem 0rem 0.3rem
		.translation-top d:hflex jc:space-between ai:flex-start pb:0.5rem
		.delete-btn-box bgc:gray0
		.delete-btn bgi:url("./assets/trash-solid.svg") bgs:cover p:0.5rem m:0.5em bd:none
		.highlighted bgc: var(--strong-red)
	prop translations = [
		{
			id: 1,
			englishText: 'Hi',
			norwegianText: 'Hei',
			gifUrl: 'https://media1.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif?cid=6f294ec9ynbseroxv3yyr14sshx9hc1bz2giazu3k3h9mu6z&ep=v1_gifs_translate&rid=giphy.gif&ct=g'
			highlighted: false
		},
		{
			id: 2,
			englishText: 'Hi',
			norwegianText: 'Hei',
			gifUrl: 'https://media1.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif?cid=6f294ec9ynbseroxv3yyr14sshx9hc1bz2giazu3k3h9mu6z&ep=v1_gifs_translate&rid=giphy.gif&ct=g'
			highlighted: true
		},
		{
			id: 3,
			englishText: 'Hi',
			norwegianText: 'Hei',
			gifUrl: 'https://media1.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif?cid=6f294ec9ynbseroxv3yyr14sshx9hc1bz2giazu3k3h9mu6z&ep=v1_gifs_translate&rid=giphy.gif&ct=g'
			highlighted: false
		},
	]

	def handleDelete
		console.log "delete"

	<self>
		<main.container>
			<a.box.btn.history-btn route-to='/'> 'Back to Home'
			<div.box.small-header> 'Your History'
			<main.container>
				for translation in translations
					<div.box.tranlation .highlighted=translation.highlighted>
						<div.translation-top>
							<div.translation-text>
								"\"{translation.englishText}\" traslates to \"{translation.norwegianText}\""
							<div.delete-btn-box>
								<button.delete-btn @click=handleDelete>
						<div.translation-bottom.gif-box>
							<img.history-gif-img src=translation.gifUrl>		