#!/bin/bash

cd chapters
for i in beth.tex huang_proof_original.tex huang_proof_without_P_P.tex interpolation.tex introduction.tex  lk.tex lyndon.tex  maehara.tex preliminaries.tex reduction.tex resolution.tex   semantic_proof.tex subtermrelation-nested.tex quant_alt.tex; do
	aspell -l en_US -t check $i
done

