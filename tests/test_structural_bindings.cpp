#include "gtest/gtest.h"
#include "structural_bindings.h"

TEST(structural_bindings, structural_bindings)
{
    structural_bindings();
    EXPECT_EQ(1, 1) << "Test message";
}
