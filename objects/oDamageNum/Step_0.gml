framesAlive++;
framesToLive--;

if (framesToLive <= 0)
{
	instance_destroy();
}