global css 
	body ff:Arial d:vflex jc:center ai:center h:100vh m:0 ff:'Norse Font Bold'

tag app
	<self>
		<div route='/'>
			<div> 'Say It in Norwegian'
			<a route-to='/history'> 'History'
		<div route='/history'>
			<div> 'History'
			<a route-to='/'> 'Home'

imba.mount <app>
