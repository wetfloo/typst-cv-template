#import "./node.typ": *
#import "./template.typ": *

#let entrypoint(
	dark-mode: true,
	debug: false,
	mirror-top-items: false,
) = {
	let bg = rgb(0xFF, 0xFF, 0xFF, 0xFF)
	let fg = rgb(0x00, 0x00, 0x00, 0xFF)
	if dark-mode {
		bg = rgb(0x00, 0x00, 0x00, 0xFF)
		fg = rgb(0xFF, 0xFF, 0xFF, 0xFF)
	}

	let top-item-align-direction = top + right
	let profile-picture-align-direction = top + left

	if mirror-top-items {
		(
			top-item-align-direction,
			profile-picture-align-direction
		) = (
			profile-picture-align-direction,
			top-item-align-direction,
		)
	}

	let template = template.with(
		bg: bg,
		fg: fg,
	)

	let invisible-text = invisible-text.with(
		bg: bg,
		fg: red,
		debug: debug,
	)
	let invisible-paragraph = invisible-paragraph.with(
		bg: bg,
		fg: red,
		debug: debug,
	)

	let generic-top-item = generic-top-item.with(
		align-direction: top-item-align-direction,
	)
	let contact-items = contact-items.with(
		align-direction: top-item-align-direction,
	)
	let profile-picture = profile-picture.with(
		align-direction: profile-picture-align-direction,
	)

	return (
		generic-top-item: generic-top-item,
		contact-items: contact-items,
		invisible-text: invisible-text,
		invisible-paragraph: invisible-paragraph,
		template: template,
		profile-picture: profile-picture,
	)
}
