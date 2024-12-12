from lxml import etree

xml_file = "receptes.xml"
xslt_file = "receptes.xsl"

xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

recipes = xml.xpath('//recepta')
print(f"Found {len(recipes)} recipes in the XML.")

for recipe in recipes:
    print(f"Processing recipe: {recipe.get('id')} - {recipe.find('nom').text}")
   
    output = transform(recipe)
   
    if output is not None:

        filename = f"receta{recipe.get('id')}.html"
       
        with open(filename, 'wb') as f:
            f.write(etree.tostring(output, pretty_print=True, encoding='utf-8'))
       
        print(f"Done: {filename}")
    else:
        print(f"{recipe.get('id')} failed")