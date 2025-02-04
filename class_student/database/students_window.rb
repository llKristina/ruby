require 'fox16'
require_relative 'Student_list_DB'
include Fox

class StudentsWindow < FXMainWindow
  def initialize(app)
    super(app, "Student Management", width: 1500, height: 600)

    @student_database = StudentsListDB.new()
    @current_page_number = 1
    @records_per_page = 10

    tabs = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X | LAYOUT_FILL_Y)

    list_tab = FXTabItem.new(tabs, "Student List", nil)
    list_frame = FXHorizontalFrame.new(tabs, LAYOUT_FILL_X | LAYOUT_FILL_Y)

    FXTabItem.new(tabs, "Tab 2")
    FXTabItem.new(tabs, "Tab 3")

    filter_section = FXVerticalFrame.new(list_frame, FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 180)
    FXLabel.new(filter_section, "Full Name:")
    @full_name_input = FXTextField.new(filter_section, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)

    create_filter_for_section(filter_section, "GitHub:")
    create_filter_for_section(filter_section, "Email:")
    create_filter_for_section(filter_section, "Phone:")
    create_filter_for_section(filter_section, "Telegram:")

    buttons_frame = FXVerticalFrame.new(list_frame, LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 180)
    FXButton.new(buttons_frame, "Add Student", nil, nil, 0, BUTTON_NORMAL | LAYOUT_CENTER_X)
    FXButton.new(buttons_frame, "Edit Student", nil, nil, 0, BUTTON_NORMAL | LAYOUT_CENTER_X)
    FXButton.new(buttons_frame, "Delete Student", nil, nil, 0, BUTTON_NORMAL | LAYOUT_CENTER_X)

    table_frame = FXVerticalFrame.new(list_frame, LAYOUT_FILL_X | LAYOUT_FILL_Y)
    @students_table = FXTable.new(table_frame, nil, 0, TABLE_READONLY | LAYOUT_FILL | TABLE_NO_COLSELECT | TABLE_NO_ROWSELECT)

    navigation_controls = FXHorizontalFrame.new(table_frame, opts: LAYOUT_CENTER_X)
    prev_button = FXButton.new(navigation_controls, "Previous")
    @page_indicator = FXLabel.new(navigation_controls, "Page: 1/1", nil, JUSTIFY_CENTER_X)
    next_button = FXButton.new(navigation_controls, "Next")
    prev_button.connect(SEL_COMMAND) { update_page(-1) }
    next_button.connect(SEL_COMMAND) { update_page(1) }

    self.connect(SEL_CLOSE) { app.exit }

    load_data_from_db
  end

  def create_filter_for_section(frame, label_text)
    section = FXVerticalFrame.new(frame, FRAME_SUNKEN | LAYOUT_FILL_X)
    FXLabel.new(section, label_text)
    combo_box = FXComboBox.new(section, 3, nil, 0, COMBOBOX_STATIC | LAYOUT_FILL_X)
    combo_box.numVisible = 3
    combo_box.appendItem("Yes")
    combo_box.appendItem("No")
    combo_box.appendItem("Doesn't matter")
    combo_box.setCurrentItem(2)
    text_field = FXTextField.new(section, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)
    text_field.enabled = false
    combo_box.connect(SEL_COMMAND) do
      if combo_box.currentItem == 0
        text_field.enabled = true
      else
        text_field.enabled = false
        text_field.text = ""
      end
    end
  end

  private def load_data_from_db
    total_students = @student_database.get_student_count
    total_pages = (total_students.to_f / @records_per_page).ceil
    @page_indicator.text = "Page: #{@current_page_number}/#{total_pages}"

    student_data = [
      ["1", "John Doe", "Yes", "john.doe@example.com"],
      ["2", "Jane Smith", "No", "jane.smith@example.com"]
    ]

    column_titles = ["ID", "Name", "GitHub", "Contact"]
    @students_table.setTableSize(student_data.length, column_titles.length)
    column_titles.each_with_index { |title, index| @students_table.setColumnText(index, title) }

    student_data.each_with_index do |row, row_index|
      row.each_with_index do |value, col_index|
        @students_table.setItemText(row_index, col_index, value)
      end
    end
    adjust_column_widths
  end

  private def adjust_column_widths
    @students_table.setColumnWidth(0, 50)
    @students_table.setColumnWidth(1, 150)
    @students_table.setColumnWidth(2, 100)
    @students_table.setColumnWidth(3, 180)
  end

  def update_page(direction)
    total_students = @student_database.get_student_count
    total_pages = (total_students.to_f / @records_per_page).ceil
    new_page = @current_page_number + direction
    return if new_page < 1 || new_page > total_pages
    @current_page_number = new_page
    load_data_from_db
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end
