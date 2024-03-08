import './home'
import './history'

tag app	
	
	<self[d:vflex bgc:var(--dark-blue) m:0 p:1rem w:100% w@sm:600px ml@sm:auto mr@sm:auto]>
		<header>
			<div.box.header> 'Say It in Norwegian'
		<div route='/'>
			<home>
		<div route='/history'>
			<history>

imba.mount <app>
