
function converter(text, from, to)
{
    const converter = OpenCC.Converter({ from: from, to: to });
    const result = converter(text);
    
    return result;
}
