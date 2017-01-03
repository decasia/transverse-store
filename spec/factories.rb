def blank_mobiledoc
  {
    version: "0.3.0",
    markups: [],
    atoms: [],
    cards: [],
    sections: []
  }.to_json
end

FactoryGirl.define do
  factory :author do
    name 'Immanuel Kant'
    description '18th Century German Philosopher'
    group_id 1
  end

  factory :doc do
    name 'Preface'
    content { blank_mobiledoc }
    group_id 1
    work_id 1
  end

  factory :doc_version do
    content { blank_mobiledoc }
    group_id 1
    doc_id 1
    user_id 1
  end

  factory :note do
    name 'Epistemology'
    content { blank_mobiledoc }
    group_id 1
    author_id 1
  end

  factory :term do
    name 'Epistemology'
    example { blank_mobiledoc }
    definition { blank_mobiledoc }
    group_id 1
    author_id 1
  end

  factory :work do
    name 'First Critique'
    description 'A long book'
    group_id 1
    author_id 1
  end
end
