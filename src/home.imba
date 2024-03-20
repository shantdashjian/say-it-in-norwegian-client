import play from './utils/voiceLibrary.imba'
import { v4 as uuidv4 } from 'uuid'
import loadingImgUrl from './assets/loading.webp'
import { handleClick } from './utils/events'

global css 
	* box-sizing:border-box
	body 
		d:vflex jc:start ai:center  m:0 p:1rem 0.7rem 1rem 0.7rem ff:'Norse Font Bold', system-ui
		bgi:url("./assets/background.png") bgs:cover bgp:center bgr:no-repeat bga:fixed
		--dark-blue:#002368
		--light-red:#fdd2d3
		--strong-red:#f35658
		c:var(--dark-blue)

	.box bgc:gray0 bd: none w: 100% p: 0.65rem 0.65rem 0.5rem 0.65rem
	.header fs:2.5rem ta:center bgc:var(--light-red) p:1rem 0.8rem 0.6rem 0.8rem mb:1rem
	.container d:vflex g:1rem 
	textarea resize:none ta:left fs:2rem ff:'Norse Font', system-ui h: 15vh c: var(--dark-blue)
	.textarea h:15vh
	.buttons d:flex g:1rem jc:space-between
	.btn bd:none ff:'Norse Font Bold', system-ui fs:1.5rem bgc:var(--light-red) c:var(--dark-blue) flg:1
	.btn@hover@sm bgc:var(--strong-red)
	.btn@focus@sm bgc:var(--strong-red)
	.clicked bgc:var(--strong-red) transform: translateY(4px) transition: background-color 0.3s
	.speak-box d:flex jc:center w:100% p:0.6rem 0.8rem 0.4rem 0.8rem
	.speak-btn w:2rem h:2rem
	.get-gif-btn flg:1
	.history-btn w:fit-content as:center
	a td:none c:var(--dark-blue) w:100% d:block ta:center
	.gif-box mih:25vh pos:relative d:hflex jc:center
	.loading-img h:0 w:auto zi:5 pos:absolute maw:95% mah:95%
	.on h:100%
	.gif-img h:0 w:auto pos:absolute maw:95% mah:95%
	.gif-on h:100%

tag home
	prop loadingTranslation = false
	prop loadingGif = false
	prop translation = getNewTranslation()
	prop snow? = true

	prop apiBaseUrl = import.meta.env.VITE_API_BASE_URL
	prop resourcePath = '/api/translation'
	prop apiEndpoint =  apiBaseUrl + resourcePath

	def mount
		translation = getNewTranslation()
		const input = document.getElementById('englishTextInput')
		input.focus()
		imba.commit()
	
	def handleTranslate e
		if translation.englishText !== ''
			handleClick(e, snow?)
			loadingTranslation = true
			translation.norwegianText = ''
			const options = 
				method: 'POST'
				body: JSON.stringify 
					englishText: translation.englishText
				headers:
					'Content-Type': 'application/json'
			const response = await window.fetch(apiEndpoint, options)
			const result = await response.json()
			loadingTranslation = false
			translation.norwegianText = result.norwegianText
			translation.id = uuidv4()
			emit('saveTranslation', translation)
	
	def handleSpeak e
		if translation.norwegianText !== ''
			handleClick(e, snow?)
			play(translation.norwegianText)

	def getNewTranslation 
		{
			id: null,
			englishText: '',
			norwegianText: '',
			gifUrl: loadingImgUrl
		}	
	
	def handleClear e
		handleClick(e, snow?)
		translation = getNewTranslation()
		loadingGif = false
		const input = document.getElementById('englishTextInput')
		input.focus()

	def handleGetGif e
		if translation.norwegianText !== ''
			handleClick(e, snow?)
			loadingGif = true
			translation.gifUrl = ''
			const apiKey = import.meta.env.VITE_GIPHY_API_KEY
			const searchText = translation.englishText
			const rating = 'g'
			const response = await window.fetch("https://api.giphy.com/v1/gifs/translate?api_key={apiKey}&s={searchText}&rating={rating}")
			const result = await response.json()
			translation.gifUrl = result.data.images.original.url
			loadingGif = false
			emit('saveTranslation', translation)
		else
			loadingGif = true

	<self>
		<main.container>
			<div.snow [as:flex-end fs:1.5rem]>
				<label htmlFor='snow-checkboax' [c:white]> 'Snow'
				<input type='checkbox' id='snow-checkboax' bind=snow?>
			<textarea.box bind=translation.englishText placeholder='Write something' id='englishTextInput'>
			<section.buttons>
				<button.box.btn disabled=!translation.englishText @click=handleTranslate> 'Translate'
				<button.speak-box.btn disabled=!translation.norwegianText @click=handleSpeak>
					<svg.speak-btn src='./assets/volume-high-solid.svg' alt='Speak'>
				<button.box.btn @click=handleClear> 'Clear'
			<div.textarea [pos:relative d:hflex jc:center ai:center]>
				<img.loading-img .on=loadingTranslation src='./assets/loading.webp'>
				<textarea.box [pos:absolute t:50% l:50% translate:-50% -50%] bind=translation.norwegianText readOnly>
			<section.buttons>
				<button.box.btn.get-gif disabled=!translation.englishText @click=handleGetGif> 'Get GIF'
				<a.box.btn.history-btn route-to='/history' @click=handleClick(e, snow?)> 'History'
			<div.box.gif-box [d:hflex jc:center ai:center]>
				<img.loading-img .on=loadingGif src='./assets/loading.webp'>
				<img.gif-img .gif-on=translation.gifUrl src=translation.gifUrl>