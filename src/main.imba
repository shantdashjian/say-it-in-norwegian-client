import play from './utils/voiceLibrary.imba'

global css 
	* box-sizing:border-box
	body 
		d:vflex jc:start ai:center h:100vh m:0 p:2rem 0.7rem 0.7rem 0.7rem ff:'Norse Font Bold', system-ui
		bgi:url("./assets/background.png") bgs:cover bgp:center bgr:no-repeat bga:fixed
		--dark-blue:#002368
		--light-red:#fdd2d3
		c:var(--dark-blue)

	.box bgc:gray0 bd: none w: 100% p: 0.65rem 0.65rem 0.5rem 0.65rem
	.header fs:2.5rem ta:center bgc:var(--light-red) p:1rem 0.8rem 0.6rem 0.8rem mb:2rem
	.container d:vflex g:1rem 
	textarea resize:none ta:left fs:2rem ff:'Norse Font', system-ui h: 15vh c: var(--dark-blue)
	.textarea h:15vh
	.buttons d:flex g:1rem jc:space-between
	.btn bd:none ff:'Norse Font Bold', system-ui fs:1.5rem bgc:var(--light-red) c:var(--dark-blue) flg:1
	.speak-box d:flex jc:center w:100% p:0.6rem 0.8rem 0.4rem 0.8rem
	.speak-btn w:2rem h:2rem
	.get-gif-btn flg:1
	.history-btn flg:1
	a td:none c:var(--dark-blue) w:100% d:block ta:center
	.gif-box mih:25vh pos:relative
	.loading-img h:0 w:auto zi:5 pos:absolute maw:95% mah:95%
	.on h:100%
	.gif-img h:0 w:auto pos:absolute maw:95% mah:95%
	.gif-on h:100%

tag app
	prop englishText = ''
	prop norwegianText = ''
	prop loadingTranslation = false
	prop loadingGif = false
	prop gifUrl = ''

	prop apiBaseUrl = import.meta.env.VITE_API_BASE_URL
	prop resourcePath = '/api/translation'
	prop apiEndpoint =  apiBaseUrl + resourcePath

	def mount
		const input = document.getElementById('englishTextInput')
		input.focus()

	def handleTranslate
		if englishText !== ''
			loadingTranslation = true
			norwegianText = ''
			const options = 
				method: 'POST'
				body: JSON.stringify 
					englishText: englishText
				headers:
					'Content-Type': 'application/json'
			const response = await window.fetch(apiEndpoint, options)
			const result = await response.json()
			loadingTranslation = false
			norwegianText = result.norwegianText
	
	def handleSpeak
		if norwegianText !== ''
			play(norwegianText)

	def handleClear
		englishText = ''
		norwegianText = ''
		loadingGif = false
		gifUrl = ''
		const input = document.getElementById('englishTextInput')
		input.focus()

	def handleGetGif
		if norwegianText !== ''
			loadingGif = true
			gifUrl = ''
			const apiKey = import.meta.env.VITE_GIPHY_API_KEY
			const searchText = englishText
			const rating = 'g'
			const response = await window.fetch("https://api.giphy.com/v1/gifs/translate?api_key={apiKey}&s={searchText}&rating={rating}")
			const result = await response.json()
			gifUrl = result.data.images.original.url
			loadingGif = false
		else
			loadingGif = true

	<self[d:vflex bgc:var(--dark-blue) m:0 p:1rem w:100% w@sm:600px ml@sm:auto mr@sm:auto]>
		<header>
			<div.box.header> 'Say It in Norwegian'
		<div route='/'>
			<main.container>
				<textarea.box bind=englishText placeholder='Write something' id='englishTextInput'>
				<section.buttons>
					<button.box.btn @click=handleTranslate> 'Translate'
					<button.speak-box.btn @click=handleSpeak>
						<svg.speak-btn src='./assets/volume-high-solid.svg' alt='Speak'>
					<button.box.btn @click=handleClear> 'Clear'
				<div.textarea [pos:relative d:hflex jc:center ai:center]>
					<img.loading-img .on=loadingTranslation src='https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbWx1Z2RxdG9mOHV0dHRna2lvd20yczBqcHM4MGNoNW9qYjBxaHUyMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qEn23ee3alV8k/giphy.gif'>
					<textarea.box [pos:absolute t:50% l:50% translate:-50% -50%] bind=norwegianText readOnly>
				<section.buttons>
					<button.box.btn.get-gif @click=handleGetGif> 'Get GIF'
					<a.box.btn.history-btn route-to='/history'> 'History'
				<div.box.gif-box [d:hflex jc:center ai:center]>
					<img.loading-img .on=loadingGif src='https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbWx1Z2RxdG9mOHV0dHRna2lvd20yczBqcHM4MGNoNW9qYjBxaHUyMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qEn23ee3alV8k/giphy.gif'>
					<img.gif-img .gif-on=gifUrl src=gifUrl>
		<div route='/history'>
			<div> 'History'
			<a.box.btn.history-btn route-to='/'> 'Home'

imba.mount <app>
