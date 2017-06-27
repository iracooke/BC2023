# Troubleshooting for BC2023 Bioinformatics Workshops

## Jupyter Notebooks

- Q. My self-assessment exercises won't work and I can't find example files in the right place.
		
	>You are most likely in the wrong directory. All notebook exercises are designed to work without ever changing directories.  

	**Solution:** restart your notebook kernel.

- Q. My notebook has locked up and won't run any more commands. 
	
	>Your kernel might be waiting for input.  This can happen if you run certain commands (eg `grep`) without providing all the required inputs.  You can tell if your kernel is busy by looking at the kernel activity indicator

	**Solution:** restart your notebook kernel.

	![kernel activity](images/kernel_indicator.png?raw=true "Kernel Indicator")  
