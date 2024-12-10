from lxml import etree

# Load the XML and XSLT files
xml_file = "receptes.xml"
xslt_file = "receptes_nova_llista.xsl"

# Parse the XML and XSLT files
xml = etree.parse(xml_file)
xslt = etree.parse(xslt_file)
transform = etree.XSLT(xslt)

# Check if the XML has recipe elements
recipes = xml.xpath('//recetas')

# Apply the transformation for each recipe
for recipe in recipes:
    print(f"Processing recipes")
    
    # Perform the transformation on the individual recipe
    output = transform(recipe)
   
    # Check if the transformation produced output
    if output is not None:
        # Generate the output HTML filename based on the recipe ID
        filename = f"nova_llistareceptes.html"
       
        # Write the output to the respective file
        with open(filename, 'ab') as f:
            f.write(etree.tostring(output, pretty_print=True, encoding='utf-8'))
       
        print(f"{filename} done")
    else:
        print(f"{recipe.get('id')} failed")