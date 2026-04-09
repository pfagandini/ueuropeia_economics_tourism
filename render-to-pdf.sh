for html in docs/slides/*.html; do
    base=$(basename "$html" .html)
    decktape reveal "$html" "PDF/${base}.pdf"
    cp "PDF/${base}.pdf" "docs/PDF/${base}.pdf"
done