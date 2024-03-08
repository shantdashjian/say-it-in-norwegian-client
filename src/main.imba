import './home'
import './history'
import {persistData, loadData} from './persist'

tag app	
	prop translations = loadData()

	def handleSaveTranslation event
		const translation = event.detail
		translations.set(translation.id, {
			englishText: translation.englishText,
			norwegianText: translation.norwegianText,
			gifUrl: translation.gifUrl
		})
		persistData translations
	
	<self[d:vflex bgc:var(--dark-blue) m:0 p:1rem w:100% w@sm:600px ml@sm:auto mr@sm:auto]>
		<header>
			<div.box.header> 'Say It in Norwegian'
		<div route='/'>
			<home @saveTranslation=handleSaveTranslation>
		<div route='/history'>
			<history translations=translations>

imba.mount <app>
