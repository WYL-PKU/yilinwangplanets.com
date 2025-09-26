---
title: "Radiative Effect of Dust on the Climate of Early Mars"
collection: research
permalink: /research/earlymarsdust

type: "Project"
venue: School of Engineering and Applied Sciences, Harvard University
start_date: 2025-06-25
#end_date:
location: Cambridge, MA, US
advisor: Robin Wordsworth
highlights:
    - Calculated key radiative parameters for early Mars dust analogs by applying Mie scattering theory, generating look-up tables for radiative transfer models
    - Integrated custom Mie scattering outputs into the PCM_LBL 1D radiative-convective model to simulate the climatic impact of dust on early Mars
    - Using the theory of reflectance spectroscopy to determine the reflectance spectra of regolith
#excerpt: "this is the excerpt"
share: false
mathjax: true
---

## [Period Report (pdf)](../files/pdf/25summer_report.pdf)

### Dust Particle Scattering

I successfully built a generic pipeline to quantify the radiative impact of airborne dust or aerosol particles that is applicable to various planetary atmospheres. The pipeline takes in the particle's complex refractive index and size distribution, it then utilizes the Mie scattering theory to calculate the \\(a^2+b^2=c^2\\)

Support for MathJax (version 3.* via [jsDelivr](https://www.jsdelivr.com/), [documentation](https://docs.mathjax.org/en/latest/)) is included in the template:

{::nomarkdown}

$$
\displaylines{
\nabla \cdot E= \frac{\rho}{\epsilon_0} \\\
\nabla \cdot B=0 \\\
\nabla \times E= -\partial_tB \\\
\nabla \times B  = \mu_0 \left(J + \varepsilon_0 \partial_t E \right)
}
$$

The default delimiters of `$$...$$` and `\\[...\\]` are supported for displayed mathematics, while `\\(...\\)` should be used for in-line mathematics (ex., \\(a^2 + b^2 = c^2\\))

{::/nomarkdown}

{::nomarkdown}
$$
\displaylines{
\nabla \cdot E= \frac{\rho}{\epsilon_0} \\
\nabla \cdot B=0 \\
\nabla \times E= -\partial_tB \\
\nabla \times B  = \mu_0 \left(J + \varepsilon_0 \partial_t E \right)
}
$$
{:/nomarkdown}

<figure style="text-align: center;">
  <img src="{{ site.baseurl }}/images/research/earlymarsdust/colorimetry.png"
       alt="Colorimetry results for different materials and particle sizes (reflectance data based on Hapke model)"
       style="max-width: 80%; height: auto;">
  
  <figcaption style="font-size: 0.9em; color: #666;">
    图 1: 早期火星尘埃的颜色测量分析。
  </figcaption>
</figure>

hahaha