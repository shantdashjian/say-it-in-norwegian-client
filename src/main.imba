import OpenAI from 'openai'

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
	.giphy-box mih:25vh h:fit-content h@sm:fit-content
	.get-giphy-btn flg:1
	.history-btn flg:1
	a td:none c:var(--dark-blue) w:100% d:block ta:center
	.loading-img h:0 w:auto zi:5
	.on h:100%

const openai = new OpenAI({
	apiKey: import.meta.env.VITE_OPENAI_API_KEY,
	dangerouslyAllowBrowser: true
})

tag app
	prop englishText = ''
	prop norwegianText = ''
	prop loadingTranslation = false

	def handleTranslate
		if englishText !== ''
			loadingTranslation = true
			norwegianText = ''
			const response = await openai.chat.completions.create({
				model: "gpt-3.5-turbo",
				messages: [
					{
						"role": "system",
						"content": "You are an English to Norwegian translator."
					},
					{
						"role": "user",
						"content": "Translate this: " + englishText
					}
				]
			})
			loadingTranslation = false
			norwegianText = response.choices[0].message.content
	
	<self[d:vflex bgc:var(--dark-blue) m:0 p:1rem w:100% w@sm:600px ml@sm:auto mr@sm:auto]>
		<header>
			<div.box.header> 'Say It in Norwegian'
		<div route='/'>
			<main.container>
				<textarea.box bind=englishText placeholder='Write something'>
				<section.buttons>
					<button.box.btn @click=handleTranslate> 'Translate'
					<button.speak-box.btn>
						<svg.speak-btn src='./assets/volume-high-solid.svg' alt='Speak'>
					<button.box.btn> 'Clear'
				<div.textarea [pos:relative d:hflex jc:center ai:center]>
					<img.loading-img .on=loadingTranslation src='https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbWx1Z2RxdG9mOHV0dHRna2lvd20yczBqcHM4MGNoNW9qYjBxaHUyMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qEn23ee3alV8k/giphy.gif'>
					<textarea.box [pos:absolute t:50% l:50% translate:-50% -50%] bind=norwegianText readOnly>
				<section.buttons>
					<button.box.btn.get-giphy> 'Get Giphy'
					<a.box.btn.history-btn route-to='/history'> 'History'
				<div.box.giphy-box>
		<div route='/history'>
			<div> 'History'
			<a.box.btn.history-btn route-to='/'> 'Home'

imba.mount <app>
