require 'caxlsx'

# Create a new Excel workbook
p = Axlsx::Package.new

# Add a worksheet to the workbook
p.workbook.add_worksheet(name: "Formula Example") do |sheet|
  # Add values to cells
  sheet.add_row ['Value 1', 10] # Cell A1: Label, Cell B1: 10
  sheet.add_row ['Value 2', 20] # Cell A2: Label, Cell B2: 20
  
  # Add a formula to sum the values in cells B1 and B2
  sheet.add_row ['Sum', '=B1+B2'] # Cell A3: Label, Cell B3: Formula
end

# Save the workbook to a file
p.serialize('formula_example.xlsx')