require 'fox16'
require_relative 'Student_list_DB'
include Fox

class StudentsWindow < FXMainWindow
  def initialize(app)
    super(app, "Student Management", width: 920, height: 600)

    @student_database = StudentsListDB.new()
    @current_page_number = 1
    @records_per_page = 20

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X | LAYOUT_FILL_Y)
    tab1 = FXTabItem.new(tab_book, "Student List View", nil)
    tab1_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL_X | LAYOUT_FILL_Y)

    tab2 = FXTabItem.new(tab_book, "Tab 2")
    FXVerticalFrame.new(tab_book, LAYOUT_FILL).tap do |frame|
      FXLabel.new(frame, nil, nil, LAYOUT_CENTER_X)
    end
    tab3 = FXTabItem.new(tab_book, "Tab 3")
    FXVerticalFrame.new(tab_book, LAYOUT_FILL).tap do |frame|
      FXLabel.new(frame, nil, nil, LAYOUT_CENTER_X)
    end

    filter_frame = FXVerticalFrame.new(tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 170)
    FXLabel.new(filter_frame, "Full Name:")
    @full_name_input = FXTextField.new(filter_frame, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)
    create_filter_for_section(filter_frame, "GitHub:")
    create_filter_for_section(filter_frame, "Email:")
    create_filter_for_section(filter_frame, "Phone:")
    create_filter_for_section(filter_frame, "Telegram:")

    table_frame = FXVerticalFrame.new(tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_X | LAYOUT_FILL_Y)
    @students_table = FXTable.new(table_frame, nil, 0, TABLE_COL_SIZABLE | LAYOUT_FILL | TABLE_READONLY | TABLE_NO_COLSELECT)
    
    controls = FXHorizontalFrame.new(table_frame, opts: LAYOUT_CENTER_X)
    prev_button = FXButton.new(controls, "Previous")
    @page_indicator = FXLabel.new(controls, "Page: 1/1", nil, JUSTIFY_CENTER_X)
    next_button = FXButton.new(controls, "Next")
    prev_button.connect(SEL_COMMAND) { update_page(-1) }
    next_button.connect(SEL_COMMAND) { update_page(1) }

    control_frame = FXVerticalFrame.new(tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 100)
    @add_button = FXButton.new(control_frame, "Add", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)
    @edit_button = FXButton.new(control_frame, "Edit", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)
    @delete_button = FXButton.new(control_frame, "Delete", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)
    @update_button = FXButton.new(control_frame, "Update", nil, nil, 0, BUTTON_NORMAL | LAYOUT_FILL_X)

    @students_table.connect(SEL_SELECTED) { update_button_states }
    @students_table.connect(SEL_DESELECTED) { update_button_states }
    update_button_states

    self.connect(SEL_CLOSE) { app.exit }

    load_data_from_db
  end

  def create_filter_for_section(frame, label_text)
    section_frame = FXVerticalFrame.new(frame, FRAME_SUNKEN | LAYOUT_FILL_X)
    FXLabel.new(section_frame, label_text)
    combo = FXComboBox.new(section_frame, 3, nil, 0, COMBOBOX_STATIC | LAYOUT_FILL_X)
    combo.numVisible = 3
    combo.appendItem("Yes")
    combo.appendItem("No")
    combo.appendItem("Doesn't matter")
    combo.setCurrentItem(2)

    input_field = FXTextField.new(section_frame, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)
    input_field.enabled = false

    combo.connect(SEL_COMMAND) do
      if combo.currentItem == 0
        input_field.enabled = true
      else
        input_field.enabled = false
        input_field.text = ""
      end
    end
  end

  def update_button_states
    selected_rows = get_selected_rows
    case selected_rows.size
    when 0
      @edit_button.enabled = false
      @delete_button.enabled = false
    when 1
      @edit_button.enabled = true
      @delete_button.enabled = true
    else
      @edit_button.enabled = false
      @delete_button.enabled = true
    end
  end

  def get_selected_rows
    selected_rows = []
    (0...@students_table.numRows).each do |row|
      selected_rows << row if @students_table.rowSelected?(row)
    end
    selected_rows
  end

  def load_data_from_db
    total_students = @student_database.get_student_count
    total_pages = (total_students.to_f / @records_per_page).ceil
    @page_indicator.text = "Page: #{@current_page_number}/#{total_pages}"

    student_data = [
      ["1", "John Doe", "Yes", "john.doe@example.com"],
      ["2", "Jane Smith", "No", "jane.smith@example.com"]
    ]

    column_titles = ["ID", "Name", "GitHub", "Contact"]
    @students_table.setTableSize(student_data.length, column_titles.length)

    column_titles.each_with_index do |title, index|
      @students_table.setColumnText(index, title)
    end

    student_data.each_with_index do |row, row_index|
      row.each_with_index do |value, col_index|
        @students_table.setItemText(row_index, col_index, value)
      end
    end

    adjust_column_widths
  end

  def adjust_column_widths
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