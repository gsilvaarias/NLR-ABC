# NLR-ABC
Scripts to implement a model-based demographic inference for Solanum chilense to assess the support of three demographic models using a wide range prior
parameter distributions for effective populations size (Ne), gene-flow and divergence times parametersusing Approximate Bayesian Computation approach and NLR data.

Model 1: independent divergence of the north, coastal and mountain groups from the central group.

Model 2: same as the model 1 but the highland group diverges from the coastal group.

Model 3: same as the model 1 but the coastal group diverges from the highland group.

Divergence processes were set to occur from three different unsampled (i.e. ghost) populations.

The gene-flow among populations from different groups was set as symmetric migration only from populations of the central group with the others (i.e. no migration between north-mountain, north-coast and mountain-coast populations). Therefore, we have seven migration rate parameters: three between populations of the different groups and four rates for within-group migration (each group is represented as an island model). Between-group gene-flow was constrained to be smaller than within-group gene-flow. Within a group, all populations were assumed to have the same population size for limiting the number of parameters in the models.



![models](https://user-images.githubusercontent.com/9302165/53145830-12ece580-35a2-11e9-9e5d-8b99b11c029d.png)
