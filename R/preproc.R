# Prerocesses data frames, including onehot encoding, scaling, and imputation, and label encoding
# Parameters
# ----------
# X_train (pd dataframe): X_train dateframe - Required
# X_test (pd dataframe): X_test dataframe - Default None
# auto (bool): If true we will automatically decide how to process columns, you must not use the manual settings (standard_scale, robust_scale etc.) if auto is set to true. - Default False
# OHE (list): List  of columns to be processed with sklearn OneHotEncoder, this accepts non numerical categorical rows without need for label encoding. - Default []
# standard_scale (list): List of columns to be processes with standard scalar. - Defualt []
# robust_scale (list): List of columns to be preprocessed with robust scalar. - Defualt []
# numerical_impute (list): list of column names that should be imputed using mean method. - Default []
# categorical_impute (list): list of column names that should be imputed to 'missing'. - Default []
# label_encode (dict): Keys in the dict should be the column names to transform, the values should be lists that
# contain the various values in the column, the order of the values will determine the encoding (1st element will be 0 etc.). - Default {}
# Returns
# -------
# processed pandas dataframes. X_train, X_test
# Examples
# --------
# >>> X_train, X_test = preproc(X_train, X_test, auto=True)


preproc <- function(X_train, X_test=None, auto=False, OHE=list(), standard_scale=list(), robust_scale=list(), numerical_impute=list(), categegorical_impute=list(), label_encode={}) {
  X_train
}

