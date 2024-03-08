import { reverse } from './utils/operations'
import {persistData} from './utils/persist.imba'
import './translation'

tag history
	prop translations = null

	css 
		.small-header fs:1.5rem ta:center bgc:var(--light-red) p:1rem 0.8rem 0.6rem 0.8rem mb:1rem
		.message-text fs:1.5rem bgc:gray0 p:0.3rem 0.3rem 0rem 0.3rem

	def handleHighlight key
		let translation = translations.get(key)
		translation.highlighted = !translation.highlighted
		persistData translations

	def handleDelete key
		translations.delete(key)
		persistData translations

	def render
		<self>
			<main.container>
				<a.box.btn.history-btn route-to='/'> 'Back to Home'
				<div.box.small-header> 'Your History'
				<main.container>
					if translations.size > 0
						for [key, translation] of reverse(translations)
							<translation key=key translation=translation @highlight=handleHighlight(key) @delete=handleDelete(key)>
					else
						<div.message-text> "There are no translations in your history!"		