#let template(
	bg: none,
	fg: none,
	content,
) = {
	assert.eq(type(bg), color)

	set page(
		paper: "a4",
		fill: bg,
		margin: (
			x: 1.2cm,
			y: 0.5cm,
		),
	)

	set text(
		font: "Source Serif 4",
		fallback: false,
		size: 10pt,
		style: "normal",
		weight: "regular",
		fill: fg,
		hyphenate: false,
	)
	show raw: set text(
		font: "Source Code Pro",
		size: 1.25em,
	)

	show link: underline

	let lvl-1-heading-counter = counter("lvl-1-heading")
	show heading
		.where(level: 1): content => {
			lvl-1-heading-counter.step()

			context {
				set align(center)
				set text(
					font: "Fira Sans",
					size: 20pt,
					style: "normal",
					weight: "bold",
				)
				set block(
					spacing: 1em,
					inset: block.inset + (
						top: if lvl-1-heading-counter.get().first() <= 1 {
							0pt
						} else {
							1pt
						},
					),
				)

				content
			}
		}

	show heading
		.where(level: 2): content => {
			set align(start)
			set text(
				font: "Fira Sans",
				size: 12pt,
				style: "normal",
				weight: "semibold",
			)
			set block(
				spacing: 1.2em,
			)

			upper(content)
		}

	show: content => context {
		set par(
			justify: true,
			spacing: par.spacing + 3pt,
		)

		content
	}

	content
}
