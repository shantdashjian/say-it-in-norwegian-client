import './home'

tag app	
	
	<self[d:vflex bgc:var(--dark-blue) m:0 p:1rem w:100% w@sm:600px ml@sm:auto mr@sm:auto]>
		<header>
			<div.box.header> 'Say It in Norwegian'
		<div route='/'>
			<home>
		<div route='/history'>
			<main.container>
				<a.box.btn.history-btn route-to='/'> 'Back to Home'

imba.mount <app>
