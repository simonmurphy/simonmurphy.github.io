import numpy as np
import matplotlib.pyplot as plt

# Taylor (1950) measurements (Table 1)
t = 1e-3 * np.array([0.10,0.24,0.38,0.52,0.66,0.80,0.94,1.08,1.22,1.36,1.50,\
				1.65,1.79,1.93,3.26,3.53,3.80,4.07,4.34,4.61,15,25,34,53,62]) # ms -> s

r = np.array([11.1,19.9,25.4,28.8,31.9,34.2,36.3,38.9,41.0,42.8,44.4,46.0,46.9,\
				48.7,59.0,61.1,62.9,64.3,65.6,67.3,106.5,130,145,175,185]) # m

xx = np.log10(t)
yy = np.log10(r)

# Plot the measurements
plt.figure(1, figsize=(6, 5.5))
plt.clf()
plt.plot(xx, yy, 'ro', alpha=0.5, ms=8, label='Measurements (Taylor 1950b)')

# Fix gradient at 2/5 and fit intercept
intercept = np.mean(yy[1:]) - 0.4*np.mean(xx[1:]) # ignore first point

# Plot the predicted linear relationship
xspan = np.arange(-4.5, -1, 0.01)
plt.plot(xspan, 0.4*xspan + intercept, 'k-', label=r'$\frac{2}{5}$log($t$/s) + %.3f'%intercept)

# Calculate the energy
rho0 = 1.06 # kg/m3 at 1500m altitude
S = 1.032 # Taylor used 1.032 for gamma=1.4
energy = 10**(5 * intercept) * rho0 / S**5 / 4.184e12 # kt
# NB: Taylor uses "long ton" = 1.0160 metric tons, so 1 kt = 4.25e12 J for him

# Annotate and finish plotting
plt.xlabel('log($t$/s)', fontsize=14)
plt.ylabel('log($R$/m)', fontsize=14)
plt.title('Estimated yield: %.1f kt TNT'%energy, fontsize=14)

plt.text(-2.5, 1.2, r'$R \propto E^{1/5}\rho_{0}^{-1/5}t^{2/5}$', fontsize=14)
plt.text(-2.5, 1.05, r'$E = 10^{(5\times%.3f)}\frac{\rho_{0}}{S(\gamma)^{5}}$'%intercept, fontsize=14)
plt.plot(xx[0], yy[0], 'kx', ms=15) # cross out rejected outlier

plt.legend(prop={'size': 14}, frameon=False)
plt.xticks(fontsize=13)
plt.yticks(fontsize=13)
plt.subplots_adjust(top=0.93)
plt.show()


