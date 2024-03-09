tag translation
	prop key = null
	prop translation = null

	css
		.tranlation d:vflex
		.translation-text fs:1.5rem bgc:gray0 p:0.3rem 0.3rem 0rem 0.3rem
		.translation-top d:hflex jc:space-between ai:flex-start pb:0.5rem
		.delete-btn-box bgc:gray0
		.delete-btn bgi:url("./assets/trash-solid.svg") bgs:cover p:0.5rem m:0.5em bd:none
		.highlighted bgc: var(--strong-red)
		.history-gif-img h:100% w:auto pos:absolute maw:100% mah:100%
	
	def render
		<self>
			<div.box.tranlation .highlighted=translation.highlighted @click.stop=emit("highlight")>
				<div.translation-top>
					<div.translation-text>
						"\"{translation.englishText}\" translates to \"{translation.norwegianText}\""
					<div.delete-btn-box>
						<button.delete-btn @click=emit("deleteTranslation")>
				<div.translation-bottom.gif-box>
					<img.history-gif-img src=translation.gifUrl>
