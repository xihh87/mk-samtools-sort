<sort.mk

sorted:V:
	./targets | xargs mk

'results/sorted/%.sorted.bam':	'data/%.sam'
	set -x
	mkdir -p `dirname "$target"`
	samtools view \
		-b \
		"$prereq" \
	| samtools sort \
		$SAMTOOLS_SORT_OPTS \
		-T 'results/sorted/'"$stem"'.tmp' \
		- \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"
