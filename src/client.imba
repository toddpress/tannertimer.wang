var store = {
	title: ""
	items: [
		{title: "git clone hello-world-imba"}
		{title: "npm install"}
		{title: "npm run dev"}
		{title: "play around"}
	]
	date: {
		days:0, hours: 0,minutes: 0, seconds: 0
	}
}
var second = 1000
var	minute = second * 60
var	hour = minute * 60
var	day = hour * 24

tag App
	prop date
	def build 
		@date = { 
			days: 0,
			hours: 0,
			minutes: 0,
			seconds: 0
		}

	def refreshDate
		var now = Date.new(Date.now).getTime
		var later = Date.new(2019, 7, 24).getTime
		var difference = later - now

		@date:days = Math.floor difference / day
		@date:hours = Math.floor (difference % day) / hour
		@date:minutes = Math.floor (difference % hour) / minute
		@date:seconds = Math.floor (difference % minute) / second

	def setup
		schedule(interval: 1000)

	def tick
		refreshDate
		render

	def render
		<self.vbox>
			<header.banner>
				<h1.banner__heading-1> "tannertimer.wang"
				<ul.timer>
					<li> 
						<span.time__value.time__days> "{@date:days}"
						<span.time__unit> "days"
					<li>
						<span.time__value.time__minutes> "{@date:minutes}"
						<span.time__unit> "mins"
					<li>
						<span.time__value.time__hours> "{@date:hours}"
						<span.time__unit> "hrs"
					<li>
						<span.time__value.time__seconds> "{@date:seconds}"
						<span.time__unit> "secs"

Imba.mount <App[store]>