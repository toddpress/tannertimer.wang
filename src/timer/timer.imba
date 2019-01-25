var state = {
    seconds: 0
}
tag Timer
	def render
		<self.vbox>
			<header>
				<input[data:title] placeholder="New..." :keyup.enter.addItem>
				<button :tap.addItem> "Add item"
			<ul> for item in data:items
				<li> item:title
			<div> "{@time}" 