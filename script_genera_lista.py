from lxml import etree

xml_file = "receptes.xml"
xslt_file = "receptes_nova_llista.xsl"

xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

recipes = xml.xpath('//recetas')

for recipe in recipes:
    print(f"Processing recipes")
    
    output = transform(recipe)
   
    if output is not None:

        filename = f"nova_llistareceptes.html"
       
        with open(filename, 'ab') as f:
            f.write(etree.tostring(output, pretty_print=True, encoding='utf-8'))
       
        print(f"{filename} done")
    else:
        print(f"{recipe.get('id')} failed")