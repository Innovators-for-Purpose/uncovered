extends Polygon2D

# Bon was a bored speices
# Bon wishes to play with you.
var rng = RandomNumberGenerator.new()
func _process(_delta):
	rng.randomize()
	print(rng.randi_range(1,3))
	var values = [0, 0.5, 1]
	var r = 0
	var g = 0
	var b = 0
	while r == 0 and g == 0 and b == 0:
		r = values[randi() % values.size()]
		g = values[randi() % values.size()]
		b = values[randi() % values.size()]
	self.color = Color.from_hsv((randi() % 12) / 12.0, 1, 1)
