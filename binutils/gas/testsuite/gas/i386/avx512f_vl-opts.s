# Check 32bit AVX512{F,VL} swap instructions

	.allow_index_reg
	.text
_start:
	vmovapd	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovapd.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovapd	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovapd	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovapd.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovapd	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovapd	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovapd.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovapd	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovapd	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovapd.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovapd	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovaps.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovaps	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovaps.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovaps	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovaps.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovaps	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovaps.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovaps	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa32	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa32	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa32	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa32	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa64	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqa64	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa64	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqa64	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu32	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu32	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu32	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu32	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu64	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovdqu64	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu64	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovdqu64	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovupd.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovupd	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovupd.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovupd	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovupd.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovupd	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovupd.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovupd	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovups	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovups.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovups	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovups	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovups.s	%xmm5, %xmm6{%k7}	 # AVX512{F,VL}
	vmovups	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%xmm5, %xmm6{%k7}{z}	 # AVX512{F,VL}
	vmovups	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovups.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovups	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovups	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovups.s	%ymm5, %ymm6{%k7}	 # AVX512{F,VL}
	vmovups	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%ymm5, %ymm6{%k7}{z}	 # AVX512{F,VL}

	.intel_syntax noprefix
	vmovapd	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovapd.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovapd	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovapd.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovapd	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovapd.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovapd	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovapd.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovapd	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovapd.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovapd	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovapd.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovapd	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovapd.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovapd	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovapd.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovaps	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovaps.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovaps	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovaps.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovaps	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovaps.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovaps	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovaps.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovaps	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovaps.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovaps	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovaps.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovaps	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovaps.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovaps	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovaps.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa32	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa32.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa32	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa32.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa32	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa32.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa32	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa32.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa32	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa32.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa32	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa32.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa32	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa32.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa32	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa32.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa64	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa64.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa64	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa64.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa64	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa64.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqa64	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa64.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqa64	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa64.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa64	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa64.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa64	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa64.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqa64	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqa64.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu32	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu32.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu32	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu32.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu32	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu32.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu32	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu32.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu32	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu32.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu32	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu32.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu32	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu32.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu32	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu32.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu64	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu64.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu64	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu64.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu64	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu64.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovdqu64	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu64.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovdqu64	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu64.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu64	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu64.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu64	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu64.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovdqu64	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovdqu64.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovupd	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovupd.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovupd	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovupd.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovupd	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovupd.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovupd	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovupd.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovupd	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovupd.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovupd	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovupd.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovupd	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovupd.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovupd	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovupd.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovups	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovups.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovups	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovups.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovups	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovups.s	xmm6{k7}, xmm5	 # AVX512{F,VL}
	vmovups	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovups.s	xmm6{k7}{z}, xmm5	 # AVX512{F,VL}
	vmovups	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovups.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovups	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovups.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovups	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovups.s	ymm6{k7}, ymm5	 # AVX512{F,VL}
	vmovups	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
	vmovups.s	ymm6{k7}{z}, ymm5	 # AVX512{F,VL}
