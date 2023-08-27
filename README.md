# lachy_evidencebag
Evidence bag for police to store criminals items.

<b>Features:</b>
- 0.0 ms Usage
- Can customize the item name, image and storage.

<b>Dependencies:</b>
- ox_inventory

<b>Preview:</b>
- https://www.youtube.com/watch?v=BtgfmmGzMBo

## Installation
- Download lachy_evidencebag
- Add evidence bag image to <b>ox_inventory\web\images</b> (you can use your image or can use the image in <b>lachy_evidencebag\image</b>)
- Add evidence bag item to ox_inventory as it is in <b>"Item data"</b> section below
- You must ensure <b>lachy_evidencebag</b> before <b>ox_inventory</b>

## Item data
Add this data to: <b>ox_inventory\data\items.lua</b>
```
	['evidencebag'] = {
		label = 'Evidence bag',
		weight = 220,
		stack = false,
		consume = 0,
		client = {
			export = 'lachy_evidencebag.openEvidencebag'
		}
	},
```
