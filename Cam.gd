class_name CameraEffects extends Camera3D

func _process(delta):
	position = lerp(position, Vector3.ZERO,0.9)

func shake(force, time):
	var start := Time.get_ticks_msec()
	while (Time.get_ticks_msec() < start+time*1000):
		shake_once(force)
		await  get_tree().process_frame

func shake_once(force : float):
	position += (Vector3(randf(),randf(),randf())-Vector3.ONE*0.5)*force

func zooming(to_ratio:float, time:float):
	var time_msec = time * 1000
	var start := Time.get_ticks_msec()
	var start_fov := fov/75.0
	while (Time.get_ticks_msec() < start+time_msec):
		var t = (Time.get_ticks_msec()-start)/time_msec
		zoom(lerp(start_fov,to_ratio,t))
		await  get_tree().process_frame
	zoom(to_ratio)

func zoom(ratio:float):
	fov = 75*ratio
