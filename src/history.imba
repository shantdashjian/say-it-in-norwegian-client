import { reverse } from './utils/operations'
import {persistData} from './persist'

tag history
	prop translations = null

	css
		.small-header fs:1.5rem ta:center bgc:var(--light-red) p:1rem 0.8rem 0.6rem 0.8rem mb:1rem
		.tranlation d:vflex
		.translation-text fs:1.5rem bgc:gray0 p:0.3rem 0.3rem 0rem 0.3rem
		.translation-top d:hflex jc:space-between ai:flex-start pb:0.5rem
		.delete-btn-box bgc:gray0
		.delete-btn bgi:url("./assets/trash-solid.svg") bgs:cover p:0.5rem m:0.5em bd:none
		.highlighted bgc: var(--strong-red)
		.history-gif-img h:100% w:auto pos:absolute maw:100% mah:100%

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
							<div.box.tranlation .highlighted=translation.highlighted @click.stop=handleHighlight(key)>
								<div.translation-top>
									<div.translation-text>
										"\"{translation.englishText}\" traslates to \"{translation.norwegianText}\""
									<div.delete-btn-box>
										<button.delete-btn @click=handleDelete(key)>
								<div.translation-bottom.gif-box>
									<img.history-gif-img src=translation.gifUrl>
					else
						<div.translation-text> "There are no translations in your history!"		