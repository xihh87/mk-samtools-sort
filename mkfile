<sort.mk

SORT_TARGETS=`{ \
	find -L data/ -type f -name '*.sam' \
	| sed -e 's#data/#results/sorted/#g' \
		-e 's#\.sam#.sorted.sam#g' \
}

sorted:V:	$SORT_TARGETS

'results/sorted/%.sorted.sam':	'data/%.sam'
	mkdir -p `dirname $target`
	sort $prereq > $target