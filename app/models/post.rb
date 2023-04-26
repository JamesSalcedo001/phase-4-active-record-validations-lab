class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :title_is_clickbaity?

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]


    def title_is_clickbaity?
        if CLICKBAIT.none? {|phrase| phrase.match title}
            errors.add(:title, "needs more clickbait!!!")
        end
    end
end
