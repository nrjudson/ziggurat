/// @description Self-destruct
if (--timeToLive < 0)
	instance_destroy();